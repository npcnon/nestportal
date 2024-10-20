import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { StudentBasicInfo, Prisma } from '@prisma/client';
import { CreateStudentBasicInfoDto } from '../dto/create.student-basic-info.dto';

@Injectable()
export class StudentBasicInfoService {
  constructor(private prisma: PrismaService) {}

  async create(data: CreateStudentBasicInfoDto): Promise<StudentBasicInfo> {
    return this.prisma.studentBasicInfo.create({
      data: {
        first_name: data.first_name,
        middle_name: data.middle_name,
        last_name: data.last_name,
        suffix: data.suffix,
        is_transferee: data.is_transferee,
        year_level: data.year_level,
        contact_number: data.contact_number,
        address: data.address,
        campus: { connect: { id: data.campus_id } }, 
        program: { connect: { id: data.program_id } }, 
        birth_date: new Date(`${data.birth_date}T00:00:00Z`),
        sex: data.sex,
        email: data.email,
        is_active: data.is_active !== undefined ? data.is_active : true, 
        is_deleted: data.is_deleted !== undefined ? data.is_deleted : false, 
      },
    });
  }

  async findAll(): Promise<StudentBasicInfo[]> {
    return this.prisma.studentBasicInfo.findMany();
  }

  async findOne(basicdata_applicant_id: number): Promise<StudentBasicInfo | null> {
    return this.prisma.studentBasicInfo.findUnique({ where: { basicdata_applicant_id } });
  }

  async update(id: number, updateStudentBasicInfoDto: CreateStudentBasicInfoDto) {
    return this.prisma.studentBasicInfo.update({
      where: { basicdata_applicant_id: id },
      data: updateStudentBasicInfoDto,
    });
  }
  
  async findByEmail(email: string): Promise<StudentBasicInfo | null> {
    return this.prisma.studentBasicInfo.findUnique({ where: { email } });
  }
  async remove(basicdata_applicant_id: number): Promise<StudentBasicInfo> {
    return this.prisma.studentBasicInfo.delete({ where: { basicdata_applicant_id } });
  }
}
