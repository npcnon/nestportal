import { Module } from '@nestjs/common';
import { CampusModule } from './campus/campus.module';

@Module({
  imports: [CampusModule],
})
export class AppModule {}