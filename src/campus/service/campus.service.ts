// src/campus/service/campus.service.ts
import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { Campus, Prisma } from '@prisma/client';

@Injectable()
export class CampusService {
  constructor(private prisma: PrismaService) {}

  async create(data: Prisma.CampusCreateInput): Promise<Campus> {
    return this.prisma.campus.create({ data });
  }

  async findAll(): Promise<Campus[]> {
    return this.prisma.campus.findMany();
  }

  async findOne(id: number): Promise<Campus | null> {
    return this.prisma.campus.findUnique({ where: { id } });
  }

  async update(id: number, data: Prisma.CampusUpdateInput): Promise<Campus> {
    return this.prisma.campus.update({ where: { id }, data });
  }

  async remove(id: number): Promise<Campus> {
    return this.prisma.campus.delete({ where: { id } });
  }
}