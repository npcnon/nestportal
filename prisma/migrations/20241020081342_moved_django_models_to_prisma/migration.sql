-- AlterTable
ALTER TABLE `campus` MODIFY `id` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `EmailVerification` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `verification_code` VARCHAR(191) NOT NULL,
    `is_verified` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `expires_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `EmailVerification_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Department` (
    `id` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `campus_id` INTEGER NOT NULL,
    `code` VARCHAR(191) NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Department_name_campus_id_code_key`(`name`, `campus_id`, `code`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Program` (
    `id` INTEGER NOT NULL,
    `code` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `department_id` INTEGER NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Program_description_department_id_key`(`description`, `department_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Employee` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `campus_id` INTEGER NOT NULL,
    `department_id` INTEGER NOT NULL,
    `role` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NULL,
    `first_name` VARCHAR(191) NOT NULL,
    `middle_name` VARCHAR(191) NULL,
    `last_name` VARCHAR(191) NOT NULL,
    `qualifications` JSON NULL,
    `gender` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `birth_date` DATETIME(3) NOT NULL,
    `contact_number` VARCHAR(191) NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Semester` (
    `id` INTEGER NOT NULL,
    `campus_id` INTEGER NOT NULL,
    `semester_name` VARCHAR(191) NOT NULL,
    `school_year` VARCHAR(191) NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Class` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `program_id` INTEGER NOT NULL,
    `semester_id` INTEGER NOT NULL,
    `employee_id` INTEGER NOT NULL,
    `schedule` VARCHAR(191) NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `StudentBasicInfo` (
    `basicdata_applicant_id` INTEGER NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(191) NOT NULL,
    `middle_name` VARCHAR(191) NULL,
    `last_name` VARCHAR(191) NOT NULL,
    `suffix` VARCHAR(191) NULL,
    `is_transferee` BOOLEAN NOT NULL,
    `year_level` VARCHAR(191) NOT NULL,
    `contact_number` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `campus_id` INTEGER NOT NULL,
    `program_id` INTEGER NOT NULL,
    `birth_date` DATETIME(3) NOT NULL,
    `sex` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `StudentBasicInfo_email_key`(`email`),
    PRIMARY KEY (`basicdata_applicant_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BugReport` (
    `report_id` INTEGER NOT NULL AUTO_INCREMENT,
    `report_data` VARCHAR(191) NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`report_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `StudentPersonalData` (
    `fulldata_applicant_id` INTEGER NOT NULL AUTO_INCREMENT,
    `basicdata_applicant_id` INTEGER NOT NULL,
    `f_name` VARCHAR(191) NOT NULL,
    `m_name` VARCHAR(191) NULL,
    `suffix` VARCHAR(191) NULL,
    `l_name` VARCHAR(191) NOT NULL,
    `sex` VARCHAR(191) NOT NULL,
    `birth_date` DATETIME(3) NOT NULL,
    `birth_place` VARCHAR(191) NOT NULL,
    `marital_status` VARCHAR(191) NOT NULL,
    `religion` VARCHAR(191) NOT NULL,
    `country` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `acr` VARCHAR(191) NULL,
    `status` VARCHAR(191) NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `StudentPersonalData_basicdata_applicant_id_key`(`basicdata_applicant_id`),
    UNIQUE INDEX `StudentPersonalData_f_name_m_name_suffix_l_name_sex_birth_da_key`(`f_name`, `m_name`, `suffix`, `l_name`, `sex`, `birth_date`, `birth_place`, `marital_status`, `religion`, `country`, `email`, `acr`, `status`),
    PRIMARY KEY (`fulldata_applicant_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `StudentOfficialInfo` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fulldata_applicant_id` INTEGER NOT NULL,
    `student_id` VARCHAR(191) NOT NULL,
    `campus_id` INTEGER NOT NULL,
    `password` VARCHAR(191) NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `StudentOfficialInfo_fulldata_applicant_id_key`(`fulldata_applicant_id`),
    UNIQUE INDEX `StudentOfficialInfo_campus_id_student_id_key`(`campus_id`, `student_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `StudentAddPersonalData` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fulldata_applicant_id` INTEGER NOT NULL,
    `city_address` VARCHAR(191) NOT NULL,
    `province_address` VARCHAR(191) NULL,
    `contact_number` VARCHAR(191) NOT NULL,
    `city_contact_number` VARCHAR(191) NULL,
    `province_contact_number` VARCHAR(191) NULL,
    `citizenship` VARCHAR(191) NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `StudentFamilyBackground` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fulldata_applicant_id` INTEGER NOT NULL,
    `father_fname` VARCHAR(191) NULL,
    `father_mname` VARCHAR(191) NULL,
    `father_lname` VARCHAR(191) NULL,
    `father_contact_number` VARCHAR(191) NULL,
    `father_email` VARCHAR(191) NULL,
    `father_occupation` VARCHAR(191) NULL,
    `father_income` INTEGER NULL,
    `father_company` VARCHAR(191) NULL,
    `mother_fname` VARCHAR(191) NULL,
    `mother_mname` VARCHAR(191) NULL,
    `mother_lname` VARCHAR(191) NULL,
    `mother_contact_number` VARCHAR(191) NULL,
    `mother_email` VARCHAR(191) NULL,
    `mother_occupation` VARCHAR(191) NULL,
    `mother_income` VARCHAR(191) NULL,
    `mother_company` VARCHAR(191) NULL,
    `guardian_fname` VARCHAR(191) NULL,
    `guardian_mname` VARCHAR(191) NULL,
    `guardian_lname` VARCHAR(191) NULL,
    `guardian_relation` VARCHAR(191) NULL,
    `guardian_contact_number` VARCHAR(191) NULL,
    `guardian_email` VARCHAR(191) NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `StudentFamilyBackground_fulldata_applicant_id_key`(`fulldata_applicant_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `StudentAcademicBackground` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fulldata_applicant_id` INTEGER NOT NULL,
    `program_id` INTEGER NOT NULL,
    `major_in` VARCHAR(191) NULL,
    `student_type` VARCHAR(191) NOT NULL,
    `semester_id` INTEGER NOT NULL,
    `year_entry` INTEGER NOT NULL,
    `year_level` VARCHAR(191) NOT NULL,
    `year_graduate` INTEGER NOT NULL,
    `application_type` VARCHAR(191) NOT NULL,
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `StudentAcademicBackground_fulldata_applicant_id_key`(`fulldata_applicant_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `StudentAcademicHistory` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fulldata_applicant_id` INTEGER NOT NULL,
    `elementary_school` VARCHAR(191) NOT NULL DEFAULT 'Not Provided',
    `elementary_address` VARCHAR(191) NOT NULL DEFAULT 'Not Provided',
    `elementary_honors` VARCHAR(191) NULL DEFAULT 'None',
    `elementary_graduate` INTEGER NULL,
    `junior_highschool` VARCHAR(191) NOT NULL DEFAULT 'Not Provided',
    `junior_address` VARCHAR(191) NOT NULL DEFAULT 'Not Provided',
    `junior_honors` VARCHAR(191) NULL DEFAULT 'None',
    `junior_graduate` INTEGER NULL,
    `senior_highschool` VARCHAR(191) NOT NULL DEFAULT 'Not Provided',
    `senior_address` VARCHAR(191) NOT NULL DEFAULT 'Not Provided',
    `senior_honors` VARCHAR(191) NULL DEFAULT 'None',
    `senior_graduate` INTEGER NULL,
    `ncae_grade` VARCHAR(191) NULL DEFAULT 'Unknown',
    `ncae_year_taken` INTEGER NULL,
    `latest_college` VARCHAR(191) NULL DEFAULT 'Not Provided',
    `college_address` VARCHAR(191) NULL DEFAULT 'Not Provided',
    `college_honors` VARCHAR(191) NULL DEFAULT 'None',
    `program` VARCHAR(191) NULL DEFAULT 'Not Specified',
    `is_active` BOOLEAN NOT NULL DEFAULT true,
    `is_deleted` BOOLEAN NOT NULL DEFAULT false,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `StudentAcademicHistory_fulldata_applicant_id_key`(`fulldata_applicant_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Department` ADD CONSTRAINT `Department_campus_id_fkey` FOREIGN KEY (`campus_id`) REFERENCES `Campus`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Program` ADD CONSTRAINT `Program_department_id_fkey` FOREIGN KEY (`department_id`) REFERENCES `Department`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Employee` ADD CONSTRAINT `Employee_campus_id_fkey` FOREIGN KEY (`campus_id`) REFERENCES `Campus`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Employee` ADD CONSTRAINT `Employee_department_id_fkey` FOREIGN KEY (`department_id`) REFERENCES `Department`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Semester` ADD CONSTRAINT `Semester_campus_id_fkey` FOREIGN KEY (`campus_id`) REFERENCES `Campus`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Class` ADD CONSTRAINT `Class_program_id_fkey` FOREIGN KEY (`program_id`) REFERENCES `Program`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Class` ADD CONSTRAINT `Class_semester_id_fkey` FOREIGN KEY (`semester_id`) REFERENCES `Semester`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Class` ADD CONSTRAINT `Class_employee_id_fkey` FOREIGN KEY (`employee_id`) REFERENCES `Employee`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudentBasicInfo` ADD CONSTRAINT `StudentBasicInfo_campus_id_fkey` FOREIGN KEY (`campus_id`) REFERENCES `Campus`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudentBasicInfo` ADD CONSTRAINT `StudentBasicInfo_program_id_fkey` FOREIGN KEY (`program_id`) REFERENCES `Program`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudentPersonalData` ADD CONSTRAINT `StudentPersonalData_basicdata_applicant_id_fkey` FOREIGN KEY (`basicdata_applicant_id`) REFERENCES `StudentBasicInfo`(`basicdata_applicant_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudentOfficialInfo` ADD CONSTRAINT `StudentOfficialInfo_fulldata_applicant_id_fkey` FOREIGN KEY (`fulldata_applicant_id`) REFERENCES `StudentPersonalData`(`fulldata_applicant_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudentOfficialInfo` ADD CONSTRAINT `StudentOfficialInfo_campus_id_fkey` FOREIGN KEY (`campus_id`) REFERENCES `Campus`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudentAddPersonalData` ADD CONSTRAINT `StudentAddPersonalData_fulldata_applicant_id_fkey` FOREIGN KEY (`fulldata_applicant_id`) REFERENCES `StudentPersonalData`(`fulldata_applicant_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudentFamilyBackground` ADD CONSTRAINT `StudentFamilyBackground_fulldata_applicant_id_fkey` FOREIGN KEY (`fulldata_applicant_id`) REFERENCES `StudentPersonalData`(`fulldata_applicant_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudentAcademicBackground` ADD CONSTRAINT `StudentAcademicBackground_fulldata_applicant_id_fkey` FOREIGN KEY (`fulldata_applicant_id`) REFERENCES `StudentPersonalData`(`fulldata_applicant_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudentAcademicBackground` ADD CONSTRAINT `StudentAcademicBackground_program_id_fkey` FOREIGN KEY (`program_id`) REFERENCES `Program`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudentAcademicBackground` ADD CONSTRAINT `StudentAcademicBackground_semester_id_fkey` FOREIGN KEY (`semester_id`) REFERENCES `Semester`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `StudentAcademicHistory` ADD CONSTRAINT `StudentAcademicHistory_fulldata_applicant_id_fkey` FOREIGN KEY (`fulldata_applicant_id`) REFERENCES `StudentPersonalData`(`fulldata_applicant_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
