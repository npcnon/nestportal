import { IsNotEmpty, IsOptional, IsBoolean, IsString, IsNumber, IsDateString, IsEmail } from 'class-validator';

export class CreateStudentBasicInfoDto {

  @IsNotEmpty()
  @IsString()
  first_name: string;

  @IsOptional()
  @IsString()
  middle_name?: string;

  @IsNotEmpty()
  @IsString()
  last_name: string;

  @IsOptional()
  @IsString()
  suffix?: string;

  @IsNotEmpty()
  @IsBoolean()
  is_transferee: boolean;

  @IsNotEmpty()
  @IsString()
  year_level: string;

  @IsNotEmpty()
  @IsString()
  contact_number: string;

  @IsNotEmpty()
  @IsString()
  address: string;

  @IsNotEmpty()
  @IsNumber()
  campus_id: number;

  @IsNotEmpty()
  @IsNumber()
  program_id: number;

  @IsNotEmpty()
  @IsDateString({}, { message: 'birth_date must be a valid date string in YYYY-MM-DD format' })
  birth_date: string; // Accepts a string formatted as YYYY-MM-DD

  @IsNotEmpty()
  @IsString()
  sex: string;

  @IsNotEmpty()
  @IsEmail()
  email: string;

  @IsOptional()
  @IsBoolean()
  is_active?: boolean; 

  @IsOptional()
  @IsBoolean()
  is_deleted?: boolean; 
}
