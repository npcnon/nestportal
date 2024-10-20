-- CreateTable
CREATE TABLE "EmailVerification" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "verification_code" TEXT NOT NULL,
    "is_verified" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expires_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Campus" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Department" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "campus_id" INTEGER NOT NULL,
    "code" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "Department_campus_id_fkey" FOREIGN KEY ("campus_id") REFERENCES "Campus" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Program" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "code" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "department_id" INTEGER NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "Program_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "Department" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Qualification" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "employee_id" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "institution" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    CONSTRAINT "Qualification_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Employee" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "campus_id" INTEGER NOT NULL,
    "department_id" INTEGER NOT NULL,
    "role" TEXT NOT NULL,
    "title" TEXT,
    "first_name" TEXT NOT NULL,
    "middle_name" TEXT,
    "last_name" TEXT NOT NULL,
    "gender" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "birth_date" DATETIME NOT NULL,
    "contact_number" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "Employee_campus_id_fkey" FOREIGN KEY ("campus_id") REFERENCES "Campus" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Employee_department_id_fkey" FOREIGN KEY ("department_id") REFERENCES "Department" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Semester" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "campus_id" INTEGER NOT NULL,
    "semester_name" TEXT NOT NULL,
    "school_year" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "Semester_campus_id_fkey" FOREIGN KEY ("campus_id") REFERENCES "Campus" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Class" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "program_id" INTEGER NOT NULL,
    "semester_id" INTEGER NOT NULL,
    "employee_id" INTEGER NOT NULL,
    "schedule" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "Class_program_id_fkey" FOREIGN KEY ("program_id") REFERENCES "Program" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Class_semester_id_fkey" FOREIGN KEY ("semester_id") REFERENCES "Semester" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Class_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employee" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "StudentBasicInfo" (
    "basicdata_applicant_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "first_name" TEXT NOT NULL,
    "middle_name" TEXT,
    "last_name" TEXT NOT NULL,
    "suffix" TEXT,
    "is_transferee" BOOLEAN NOT NULL,
    "year_level" TEXT NOT NULL,
    "contact_number" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "campus_id" INTEGER NOT NULL,
    "program_id" INTEGER NOT NULL,
    "birth_date" DATETIME NOT NULL,
    "sex" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "StudentBasicInfo_campus_id_fkey" FOREIGN KEY ("campus_id") REFERENCES "Campus" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "StudentBasicInfo_program_id_fkey" FOREIGN KEY ("program_id") REFERENCES "Program" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "BugReport" (
    "report_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "report_data" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "StudentPersonalData" (
    "fulldata_applicant_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "basicdata_applicant_id" INTEGER NOT NULL,
    "f_name" TEXT NOT NULL,
    "m_name" TEXT,
    "suffix" TEXT,
    "l_name" TEXT NOT NULL,
    "sex" TEXT NOT NULL,
    "birth_date" DATETIME NOT NULL,
    "birth_place" TEXT NOT NULL,
    "marital_status" TEXT NOT NULL,
    "religion" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "acr" TEXT,
    "status" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "StudentPersonalData_basicdata_applicant_id_fkey" FOREIGN KEY ("basicdata_applicant_id") REFERENCES "StudentBasicInfo" ("basicdata_applicant_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "StudentOfficialInfo" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fulldata_applicant_id" INTEGER NOT NULL,
    "student_id" TEXT NOT NULL,
    "campus_id" INTEGER NOT NULL,
    "password" TEXT,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "StudentOfficialInfo_fulldata_applicant_id_fkey" FOREIGN KEY ("fulldata_applicant_id") REFERENCES "StudentPersonalData" ("fulldata_applicant_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "StudentOfficialInfo_campus_id_fkey" FOREIGN KEY ("campus_id") REFERENCES "Campus" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "StudentAddPersonalData" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fulldata_applicant_id" INTEGER NOT NULL,
    "city_address" TEXT NOT NULL,
    "province_address" TEXT,
    "contact_number" TEXT NOT NULL,
    "city_contact_number" TEXT,
    "province_contact_number" TEXT,
    "citizenship" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "StudentAddPersonalData_fulldata_applicant_id_fkey" FOREIGN KEY ("fulldata_applicant_id") REFERENCES "StudentPersonalData" ("fulldata_applicant_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "StudentFamilyBackground" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fulldata_applicant_id" INTEGER NOT NULL,
    "father_fname" TEXT,
    "father_mname" TEXT,
    "father_lname" TEXT,
    "father_contact_number" TEXT,
    "father_email" TEXT,
    "father_occupation" TEXT,
    "father_income" INTEGER,
    "father_company" TEXT,
    "mother_fname" TEXT,
    "mother_mname" TEXT,
    "mother_lname" TEXT,
    "mother_contact_number" TEXT,
    "mother_email" TEXT,
    "mother_occupation" TEXT,
    "mother_income" TEXT,
    "mother_company" TEXT,
    "guardian_fname" TEXT,
    "guardian_mname" TEXT,
    "guardian_lname" TEXT,
    "guardian_relation" TEXT,
    "guardian_contact_number" TEXT,
    "guardian_email" TEXT,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "StudentFamilyBackground_fulldata_applicant_id_fkey" FOREIGN KEY ("fulldata_applicant_id") REFERENCES "StudentPersonalData" ("fulldata_applicant_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "StudentAcademicBackground" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fulldata_applicant_id" INTEGER NOT NULL,
    "program_id" INTEGER NOT NULL,
    "major_in" TEXT,
    "student_type" TEXT NOT NULL,
    "semester_id" INTEGER NOT NULL,
    "year_entry" INTEGER NOT NULL,
    "year_level" TEXT NOT NULL,
    "year_graduate" INTEGER NOT NULL,
    "application_type" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "StudentAcademicBackground_fulldata_applicant_id_fkey" FOREIGN KEY ("fulldata_applicant_id") REFERENCES "StudentPersonalData" ("fulldata_applicant_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "StudentAcademicBackground_program_id_fkey" FOREIGN KEY ("program_id") REFERENCES "Program" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "StudentAcademicBackground_semester_id_fkey" FOREIGN KEY ("semester_id") REFERENCES "Semester" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "StudentAcademicHistory" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fulldata_applicant_id" INTEGER NOT NULL,
    "elementary_school" TEXT NOT NULL DEFAULT 'Not Provided',
    "elementary_address" TEXT NOT NULL DEFAULT 'Not Provided',
    "elementary_honors" TEXT DEFAULT 'None',
    "elementary_graduate" INTEGER,
    "junior_highschool" TEXT NOT NULL DEFAULT 'Not Provided',
    "junior_address" TEXT NOT NULL DEFAULT 'Not Provided',
    "junior_honors" TEXT DEFAULT 'None',
    "junior_graduate" INTEGER,
    "senior_highschool" TEXT NOT NULL DEFAULT 'Not Provided',
    "senior_address" TEXT NOT NULL DEFAULT 'Not Provided',
    "senior_honors" TEXT DEFAULT 'None',
    "senior_graduate" INTEGER,
    "ncae_grade" TEXT DEFAULT 'Unknown',
    "ncae_year_taken" INTEGER,
    "latest_college" TEXT DEFAULT 'Not Provided',
    "college_address" TEXT DEFAULT 'Not Provided',
    "college_honors" TEXT DEFAULT 'None',
    "program" TEXT DEFAULT 'Not Specified',
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_deleted" BOOLEAN NOT NULL DEFAULT false,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "StudentAcademicHistory_fulldata_applicant_id_fkey" FOREIGN KEY ("fulldata_applicant_id") REFERENCES "StudentPersonalData" ("fulldata_applicant_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "EmailVerification_email_key" ON "EmailVerification"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Department_name_campus_id_code_key" ON "Department"("name", "campus_id", "code");

-- CreateIndex
CREATE UNIQUE INDEX "Program_description_department_id_key" ON "Program"("description", "department_id");

-- CreateIndex
CREATE UNIQUE INDEX "StudentBasicInfo_email_key" ON "StudentBasicInfo"("email");

-- CreateIndex
CREATE UNIQUE INDEX "StudentPersonalData_basicdata_applicant_id_key" ON "StudentPersonalData"("basicdata_applicant_id");

-- CreateIndex
CREATE UNIQUE INDEX "StudentPersonalData_f_name_m_name_suffix_l_name_sex_birth_date_birth_place_marital_status_religion_country_email_acr_status_key" ON "StudentPersonalData"("f_name", "m_name", "suffix", "l_name", "sex", "birth_date", "birth_place", "marital_status", "religion", "country", "email", "acr", "status");

-- CreateIndex
CREATE UNIQUE INDEX "StudentOfficialInfo_fulldata_applicant_id_key" ON "StudentOfficialInfo"("fulldata_applicant_id");

-- CreateIndex
CREATE UNIQUE INDEX "StudentOfficialInfo_campus_id_student_id_key" ON "StudentOfficialInfo"("campus_id", "student_id");

-- CreateIndex
CREATE UNIQUE INDEX "StudentFamilyBackground_fulldata_applicant_id_key" ON "StudentFamilyBackground"("fulldata_applicant_id");

-- CreateIndex
CREATE UNIQUE INDEX "StudentAcademicBackground_fulldata_applicant_id_key" ON "StudentAcademicBackground"("fulldata_applicant_id");

-- CreateIndex
CREATE UNIQUE INDEX "StudentAcademicHistory_fulldata_applicant_id_key" ON "StudentAcademicHistory"("fulldata_applicant_id");
