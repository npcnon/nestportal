import { Injectable } from '@nestjs/common';
import { Cron } from '@nestjs/schedule';
import axios from 'axios';
import { DepartmentService } from '../service/department.service';
import { CreateDepartmentDto } from '../dto/department.dto';

@Injectable()
export class DepartmentTaskService {
  constructor(private readonly departmentService: DepartmentService) {}

  @Cron('0 0 */12 * *') // Runs every 12 hours
  async handleCron() {
    console.log('Task run at:', new Date().toISOString());
    
    try {
      const response = await axios.get('https://node-mysql-signup-verification-api.onrender.com/external/get-department-active');
      console.log('Fetched data:', response.data);

      const departments: CreateDepartmentDto[] = response.data.map(department => ({
        id: department.department_id,
        name: department.departmentName,
        campus_id: department.campus_id,
        code: department.departmentCode,
        is_active: department.isActive,
      }));

      // Create or update departments in the database
      for (const departmentDto of departments) {
        try {
          // Check if the department already exists
          const existingDepartment = await this.departmentService.findOne(departmentDto.id);
          
          if (existingDepartment) {
            // If it exists, update the department
            await this.departmentService.update(departmentDto.id, {
              name: departmentDto.name,
              campus: { connect: { id: departmentDto.campus_id } }, // Use Prisma's relation connection
              code: departmentDto.code,
              is_active: departmentDto.is_active, // Fix here
            });
          } else {
            // If it doesn't exist, create a new department
            await this.departmentService.create(departmentDto);
          }
        } catch (error) {
          console.error(`Error processing department with ID ${departmentDto.id}:`, error.message);
        }
      }

      console.log('Departments updated successfully');
    } catch (error) {
      console.error('Error fetching data:', error.message);
    }
  }
}
