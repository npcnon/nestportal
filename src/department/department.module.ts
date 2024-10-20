import { Module } from '@nestjs/common';
import { DepartmentService } from './service/department.service';
import { DepartmentController } from './controller/department.controller';
import { PrismaService } from '../prisma/prisma.service';

@Module({
  controllers: [DepartmentController],
  providers: [DepartmentService, PrismaService],
})
export class DepartmentModule {}