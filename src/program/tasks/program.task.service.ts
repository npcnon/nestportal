import { Injectable } from '@nestjs/common';
import { Cron } from '@nestjs/schedule';
import axios from 'axios';
import { ProgramService } from '../service/program.service';
import { CreateProgramDto } from '../dto/program.dto';

@Injectable()
export class ProgramTaskService {
  constructor(private readonly programService: ProgramService) {}
  //@Cron('* * * * * *') to run every second
  @Cron('0 0 */12 * *') 
  async handleCron() {
    console.log('Task run at:', new Date().toISOString());
    
    try {
      const response = await axios.get('https://node-mysql-signup-verification-api.onrender.com/external/get-programs-active');
      console.log('Fetched data:', response.data);

      const programs: CreateProgramDto[] = response.data.map(program => ({
        id: program.program_id,
        code: program.programCode,
        description: program.programDescription,
        department_id: program.department_id,
        is_active: program.isActive,
      }));

      for (const programDto of programs) {
        try {
          const existingProgram = await this.programService.findOne(programDto.id);
          
          if (existingProgram) {
            await this.programService.update(programDto.id, {
              code: programDto.code,
              description: programDto.description,
              department: { connect: { id: programDto.department_id } }, 
              is_active: programDto.is_active, 
            });
          } else {
            await this.programService.create(programDto);
          }
        } catch (error) {
          console.error(`Error processing program with ID ${programDto.id}:`, error.message);
        }
      }

      console.log('Programs updated successfully');
    } catch (error) {
      console.error('Error fetching data:', error.message);
    }
  }
}
