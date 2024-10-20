import { Module } from '@nestjs/common';
import { CampusModule } from './campus/campus.module';
import { ScheduleModule } from '@nestjs/schedule';
import { CampusTaskService } from './campus/tasks/campus.task.service';
import { CampusService } from './campus/service/campus.service';
import { PrismaService } from './prisma/prisma.service';
import { DepartmentTaskService } from './department/tasks/department.task.service';
import { DepartmentService } from './department/service/department.service';
import { DepartmentModule } from './department/department.module';
import { ProgramModule } from './program/program.module';
import { ProgramTaskService } from './program/tasks/program.task.service';
import { ProgramService } from './program/service/program.service';
import { AppController } from './app.controller';

@Module({
  imports: [
    CampusModule,
    DepartmentModule,
    ProgramModule,


    ScheduleModule.forRoot()
  ],

  controllers: [AppController],
  providers: [
    CampusTaskService,
    CampusService,
    DepartmentTaskService,
    DepartmentService,
    ProgramTaskService,
    ProgramService,


    PrismaService
  ],
})
export class AppModule {}