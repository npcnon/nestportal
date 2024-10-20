import { Injectable } from '@nestjs/common';
import { Cron } from '@nestjs/schedule';
import axios from 'axios';

@Injectable()
export class TaskService {
  @Cron('0 * * * * *') // Runs every minute
  async handleCron() {
    console.log('Task run at:', new Date().toISOString());
    try {
      const response = await axios.get('https://node-mysql-signup-verification-api.onrender.com/external/get-campus-active');
      console.log('Fetched data:', response.data);
    } catch (error) {
      console.error('Error fetching data:', error.message);
    }
  }
}
