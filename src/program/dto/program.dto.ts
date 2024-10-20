import { IsNotEmpty, IsString, IsBoolean, IsNumber } from 'class-validator';

export class CreateProgramDto {
    @IsNotEmpty()
    @IsNumber()
    id: number;  

    @IsNotEmpty()
    @IsString()
    code: string;

    @IsNotEmpty()
    @IsString()
    description: string;

    @IsNotEmpty()
    @IsNumber()
    department_id: number; 

    @IsBoolean()
    is_active: boolean;
}
