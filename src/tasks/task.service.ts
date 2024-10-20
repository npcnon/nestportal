import { Injectable } from '@nestjs/common';
import { Cron } from '@nestjs/schedule';
import axios from 'axios';

@Injectable()
export class TaskService {
  @Cron('0 * * * * *') // Runs every minute
  async handleCron() {
    console.log('Task run at:', new Date().toISOString());

}
