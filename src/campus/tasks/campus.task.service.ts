import { Injectable } from '@nestjs/common';
import { Cron } from '@nestjs/schedule';
import axios from 'axios';
import { CampusService } from 'src/campus/service/campus.service';
import { CreateCampusDto } from 'src/campus/dto/campus.dto';

@Injectable()
export class CampusTaskService {
  constructor(private readonly campusService: CampusService) {} // Inject CampusService

  @Cron('0 0 */12 * *') // Runs every 12 hours
    async handleCron() {
    console.log('Task run at:', new Date().toISOString());
    try {
        const response = await axios.get('https://node-mysql-signup-verification-api.onrender.com/external/get-campus-active');
        console.log('Fetched data:', response.data);

        const campuses: CreateCampusDto[] = response.data.map(campus => ({
        id: campus.campus_id,
        name: campus.campusName,
        address: campus.campusAddress,
        is_active: campus.isActive,
        }));

        // Create or update campuses in the database
        for (const campusDto of campuses) {
            try {
                // Check if the campus already exists
                const existingCampus = await this.campusService.findOne(campusDto.id);
                if (existingCampus) {
                // If it exists, update the campus
                await this.campusService.update(campusDto.id, {
                    name: campusDto.name,
                    address: campusDto.address,
                    is_active: campusDto.is_active,
                });
                } else {
                // If it doesn't exist, create a new campus
                await this.campusService.create(campusDto);
                }
            } catch (error) {
                console.error(`Error processing campus with ID ${campusDto.id}:`, error.message);
            }
        }

        console.log('Campuses updated successfully');
        } catch (error) {
            console.error('Error fetching data:', error.message);
        }
    }
}
