# DBMS Lab Assignment 6 — Oracle SQL

Complete solutions for **Questions 1–30** in [`Assignment_6.sql`](Assignment_6.sql), including the table definition, 11 sample records, SQL queries, and constraint operations.

## How to run

1. Open Oracle SQL Developer, SQL*Plus, or another Oracle SQL client.
2. Open `Assignment_6.sql`.
3. Run Q1 first to create and populate `EMP`; then run Q2–Q27.
4. Run Q28–Q30 **only after completing the earlier questions**: Q28 removes the CHECK constraint, Q29 removes the primary key, and Q30 drops the entire table.

## Notes

- Q11: The provided data has no job named `ENGINEER`; `IT_PROG` is used as a **proxy** for technical staff. Confirm with your instructor if a different job category is intended.
- Q9 counts job IDs ending in `MGR`, not all employees who supervise others (there is no manager relationship column in the supplied table).
- Q27 verifies constraints already created in Q1, avoiding duplicate-constraint errors.
- Dates use Oracle `TO_DATE`/`TO_CHAR`, and `NLS_DATE_LANGUAGE=ENGLISH` where month names are involved.
- Q25 spells the **current system year**; the result depends on the date when it is executed.
