import { Module } from '@nestjs/common';
import { StudentBasicInfoService } from './service/student-basic-info.service';
import { StudentBasicInfoController } from './controller/student-basic-info.controller';
import { PrismaService } from '../prisma/prisma.service';

@Module({
  controllers: [StudentBasicInfoController],
  providers: [StudentBasicInfoService, PrismaService],
})
export class StudentBasicInfoModule {}