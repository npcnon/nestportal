import { Controller, Get, Post, Body, Param, Put, Delete } from '@nestjs/common';
import { DepartmentService } from '../service/department.service';
import { Department, Prisma } from '@prisma/client';
import { CreateDepartmentDto } from '../dto/department.dto';

@Controller('department')
export class DepartmentController {
  constructor(private readonly departmentService: DepartmentService) {}

  @Post()
  create(@Body() createDepartmentDto: CreateDepartmentDto): Promise<Department> {
    return this.departmentService.create(createDepartmentDto);
  }

  @Get()
  findAll(): Promise<Department[]> {
    return this.departmentService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<Department | null> {
    return this.departmentService.findOne(+id);
  }

  @Put(':id')
  update(@Param('id') id: string, @Body() updateDepartmentDto: Prisma.DepartmentUpdateInput): Promise<Department> {
    return this.departmentService.update(+id, updateDepartmentDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string): Promise<Department> {
    return this.departmentService.remove(+id);
  }
}