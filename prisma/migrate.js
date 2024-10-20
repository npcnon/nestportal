const { execSync } = require('child_process');
const path = require('path');

try {
  // Switch to SQLite
  execSync(`node ${path.join(__dirname, 'switch-db.js')} sqlite`, { stdio: 'inherit' });

  // Generate the migration
  execSync('npx prisma migrate dev', { stdio: 'inherit' });

  // Switch back to MySQL
  execSync(`node ${path.join(__dirname, 'switch-db.js')} mysql`, { stdio: 'inherit' });

  // Apply the migration to the MySQL database
  console.log('Applying migration to MySQL database...');
  execSync('npx prisma db push', { stdio: 'inherit' });

  console.log('Migration completed and applied successfully');
} catch (error) {
  console.error('Migration process failed:', error);
  // Ensure we switch back to MySQL even if there's an error
  execSync(`node ${path.join(__dirname, 'switch-db.js')} mysql`, { stdio: 'inherit' });
}