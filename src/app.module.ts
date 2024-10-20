import { Module } from '@nestjs/common';
import { CampusModule } from './campus/campus.module';
import { ScheduleModule } from '@nestjs/schedule';
import { CampusTaskService } from './campus/tasks/campus.task.service';
import { CampusService } from './campus/service/campus.service';
import { PrismaService } from './prisma/prisma.service';
import { DepartmentTaskService } from './department/tasks/department.task.service';
import { DepartmentService } from './department/service/department.service';
import { DepartmentModule } from './department/department.module';

@Module({
  imports: [
    CampusModule,
    DepartmentModule,
  
    ScheduleModule.forRoot()
  ],
  providers: [
    CampusTaskService,
    CampusService,
    DepartmentTaskService,
    DepartmentService,
    
    PrismaService
  ],
})
export class AppModule {}