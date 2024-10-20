import { Module } from '@nestjs/common';
import { ProgramService } from './service/program.service';
import { ProgramController } from './controller/program.controller';
import { PrismaService } from '../prisma/prisma.service';

@Module({
  controllers: [ProgramController],
  providers: [ProgramService, PrismaService],
})
export class ProgramModule {}