import { IsNotEmpty, IsString, IsBoolean, IsNumber } from 'class-validator';

export class CreateDepartmentDto {
    @IsNotEmpty()
    @IsNumber()
    id: number;  

    @IsNotEmpty()
    @IsString()
    name: string;

    @IsNotEmpty()
    @IsNumber()
    campus_id: number; // Only the campus ID is needed here.

    @IsNotEmpty()
    @IsString()
    code: string;

    @IsBoolean()
    is_active: boolean;
}
