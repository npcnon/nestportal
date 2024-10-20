import { Controller, Get, Post, Body, Param, Put, Delete } from '@nestjs/common';
import { ProgramService } from '../service/program.service';
import { Program, Prisma } from '@prisma/client';
import { CreateProgramDto } from '../dto/program.dto';

@Controller('program')
export class ProgramController {
  constructor(private readonly programService: ProgramService) {}

  @Post()
  create(@Body() createProgramDto: CreateProgramDto): Promise<Program> {
    return this.programService.create(createProgramDto);
  }

  @Get()
  findAll(): Promise<Program[]> {
    return this.programService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<Program | null> {
    return this.programService.findOne(+id);
  }

  @Put(':id')
  update(@Param('id') id: string, @Body() updateProgramDto: Prisma.ProgramUpdateInput): Promise<Program> {
    return this.programService.update(+id, updateProgramDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string): Promise<Program> {
    return this.programService.remove(+id);
  }
}