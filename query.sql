SELECT 
    Users.display_name AS "Contact Display Name",
    Users.organization_name AS "Employer organisation name",
    COUNT(DISTINCT contact.case_id)  AS "Number of cases"
FROM
    civicrm_case_contact contact
        LEFT JOIN
    civicrm_case `case` ON (case.id = contact.case_id)
        LEFT JOIN
    civicrm_contact Users ON (users.id = contact.contact_id)
WHERE
    case.status_id = 1
GROUP BY contact.contact_id;
