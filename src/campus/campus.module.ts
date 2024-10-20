import { Module } from '@nestjs/common';
import { CampusService } from './service/campus.service';
import { CampusController } from './controller/campus.controller';
import { PrismaService } from '../prisma/prisma.service';

@Module({
  controllers: [CampusController],
  providers: [CampusService, PrismaService],
})
export class CampusModule {}