-- BLOCK select_assessment_for_grading_job
SELECT
    ai.id AS assessment_instance_id
FROM
    grading_jobs AS gj
    JOIN submissions AS s ON (s.id = gj.submission_id)
    JOIN variants AS v ON (v.id = s.variant_id)
    LEFT JOIN instance_questions AS iq ON (iq.id = v.instance_question_id)
    LEFT JOIN assessment_instances AS ai ON (ai.id = iq.assessment_instance_id)
WHERE
    gj.id = $grading_job_id;
