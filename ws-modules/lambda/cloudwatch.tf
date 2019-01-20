resource "aws_cloudwatch_event_rule" "once_daily" {
    name = "every-five-minutes"
    description = "Fires every five minutes"
    schedule_expression = "rate(5 minutes)"
}

resource "aws_cloudwatch_event_target" "check_target_every_day" {
    rule = "${aws_cloudwatch_event_rule.once_daily.name}"
    target_id = "daily-ami-backup"
    arn = "${aws_lambda_function.daily-ami-backup.arn}"
}

resource "aws_lambda_permission" "allow_cloudwatch_to_daily_ami_backup_" {
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
    function_name = "${aws_lambda_function.daily-ami-backup.function_name}"
    principal = "events.amazonaws.com"
    source_arn = "${aws_cloudwatch_event_rule.once_daily.arn}"
}
