    import { IsNotEmpty, IsString, IsBoolean,IsNumber } from 'class-validator';

    export class CreateCampusDto {
        @IsNotEmpty()
        @IsNumber()
        id: number  

        @IsNotEmpty()
        @IsString()
        name: string;

        @IsNotEmpty()
        @IsString()
        address: string;

        @IsBoolean()
        is_active: boolean;
    }