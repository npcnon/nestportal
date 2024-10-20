import { Controller, Get, Post, Body, Param, Put, Delete } from '@nestjs/common';
import { CampusService } from '../service/campus.service';
import { Campus, Prisma } from '@prisma/client';
import { CreateCampusDto } from '../dto/campus.dto';

@Controller('campus')
export class CampusController {
  constructor(private readonly campusService: CampusService) {}

  @Post()
  create(@Body() createCampusDto: CreateCampusDto): Promise<Campus> {
    return this.campusService.create(createCampusDto);
  }

  @Get()
  findAll(): Promise<Campus[]> {
    return this.campusService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<Campus | null> {
    return this.campusService.findOne(+id);
  }

  @Put(':id')
  update(@Param('id') id: string, @Body() updateCampusDto: Prisma.CampusUpdateInput): Promise<Campus> {
    return this.campusService.update(+id, updateCampusDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string): Promise<Campus> {
    return this.campusService.remove(+id);
  }
}