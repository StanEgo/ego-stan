/*
  mutation InboxMail($inbox, $subject, $content, $from, $recipients) {
    email(subject: $subject, content: $content, from: $from, recipients: $recipients) {
      inbox(id: $parent.id, target: $inbox, relation: 'inbox') {}
    }
  }
 */
CREATE OR REPLACE FUNCTION content.inbox_add_email(
  owner mesh.id,
  inbox mesh.id,
  subject text,
  content text,
  sender text,
  recipients text[]
)
RETURNS
  mesh.id
AS $$
DECLARE
  _subject text;
  _inbox mesh.id;
  _result mesh.id;
BEGIN
  _subject = LOWER(REGEXP_REPLACE(inbox_add_email.subject, '[\s\.]', '-', 'g'));
  _result = 'email-' || inbox_add_email.inbox || '-' || _subject;
  _inbox = 'inbox-' || inbox_add_email.inbox || '-' || _subject;

  INSERT INTO mesh.entity (id, owner) VALUES(_result, owner);

  INSERT INTO content.email (
    id,
    subject,
    content,
    sender,
    recipients
  ) VALUES (
    _result,
    inbox_add_email.subject,
    inbox_add_email.content,
    inbox_add_email.sender,
    inbox_add_email.recipients
  );

  INSERT INTO mesh.link (
    id,
    target,
    relation
  ) VALUES (
    _result,
    inbox_add_email.inbox,
    'relation-inbox'
  );

  RETURN _result;
END $$ LANGUAGE plpgsql;
