// src/department/service/department.service.ts
import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { Department, Prisma } from '@prisma/client';
import { CreateDepartmentDto } from '../dto/department.dto';

@Injectable()
export class DepartmentService {
  constructor(private prisma: PrismaService) {}

async create(data: CreateDepartmentDto): Promise<Department> {
    return this.prisma.department.create({
        data: {
            id: data.id,
            name: data.name,
            campus: { connect: { id: data.campus_id } }, 
            code: data.code,
            is_active: data.is_active,
        },
    });
}



  async findAll(): Promise<Department[]> {
    return this.prisma.department.findMany();
  }

  async findOne(id: number): Promise<Department | null> {
    return this.prisma.department.findUnique({ where: { id } });
  }

  async update(id: number, data: Prisma.DepartmentUpdateInput): Promise<Department> {
    return this.prisma.department.update({ where: { id }, data });
  }

  async remove(id: number): Promise<Department> {
    return this.prisma.department.delete({ where: { id } });
  }
}