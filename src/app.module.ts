import { Module } from '@nestjs/common';
import { CampusModule } from './campus/campus.module';
import { ScheduleModule } from '@nestjs/schedule';
import { TaskService } from './tasks/task.service';
@Module({
  imports: [
    CampusModule,
    ScheduleModule.forRoot()
  ],
  providers: [TaskService],
})
export class AppModule {}