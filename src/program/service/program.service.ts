// src/program/service/program.service.ts
import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { Program, Prisma } from '@prisma/client';
import { CreateProgramDto } from '../dto/program.dto';

@Injectable()
export class ProgramService {
  constructor(private prisma: PrismaService) {}

async create(data: CreateProgramDto): Promise<Program> {
    return this.prisma.program.create({
        data: {
            id: data.id,
            code: data.code,
            description: data.description,
            department: { connect: { id: data.department_id } }, // Use campus_id to connect to the campus
            is_active: data.is_active,
        },
    });
}



  async findAll(): Promise<Program[]> {
    return this.prisma.program.findMany();
  }

  async findOne(id: number): Promise<Program | null> {
    return this.prisma.program.findUnique({ where: { id } });
  }

  async update(id: number, data: Prisma.ProgramUpdateInput): Promise<Program> {
    return this.prisma.program.update({ where: { id }, data });
  }

  async remove(id: number): Promise<Program> {
    return this.prisma.program.delete({ where: { id } });
  }
}