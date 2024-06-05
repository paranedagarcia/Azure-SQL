-- insert from  csv file
BULK INSERT table_test
FROM 'C:\Users\paranedag\Documents\datos1000.csv'
WITH (FIELDTERMINATOR = ',',
      FORMAT = 'CSV', FIRSTROW = 2,
      ROWTERMINATOR = '0x0a');
