import { Controller, Get, Post, Body, Param, Put, Delete } from '@nestjs/common';
import { StudentBasicInfoService } from '../service/student-basic-info.service';
import { StudentBasicInfo, Prisma } from '@prisma/client';
import { CreateStudentBasicInfoDto } from '../dto/create.student-basic-info.dto';

@Controller('stdntbasicinfo')
export class StudentBasicInfoController {
  constructor(private readonly studentBasicInfoService: StudentBasicInfoService) {}

  @Post()
  create(@Body() createStudentBasicInfoDto: CreateStudentBasicInfoDto): Promise<StudentBasicInfo> {
    return this.studentBasicInfoService.create(createStudentBasicInfoDto);
  }

  @Get()
  findAll(): Promise<StudentBasicInfo[]> {
    return this.studentBasicInfoService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<StudentBasicInfo | null> {
    return this.studentBasicInfoService.findOne(+id);
  }

  @Put(':id')
  update(@Param('id') id: string, @Body() updateStudentBasicInfoDto: CreateStudentBasicInfoDto): Promise<StudentBasicInfo> {
    return this.studentBasicInfoService.update(+id, updateStudentBasicInfoDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string): Promise<StudentBasicInfo> {
    return this.studentBasicInfoService.remove(+id);
  }
}