SELECT 
    Users.display_name,
    Users.organization_name,
    COUNT(DISTINCT contact.case_id) cases
FROM
    civicrm_case_contact contact
        LEFT JOIN
    civicrm_case `case` ON (case.id = contact.case_id)
        LEFT JOIN
    civicrm_contact users ON (users.id = contact.contact_id)
WHERE
    case.status_id = 1
GROUP BY contact.contact_id;