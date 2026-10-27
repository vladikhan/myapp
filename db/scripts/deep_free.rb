def create_replies(root, m, n)
  return if n == 0

  r = StaffMessage.create!(
    customer: m.customer,
    staff_member: StaffMember.where(suspended: false).first,
    root: root,
    parent: m,
    subject: "REPLY",
    body: "TEST",
    status: "new"
  )

  m2 = CustomerMessage.create!(
    customer: r.customer,
    root: root,
    parent: r,
    subject: "REPLY",
    body: "REPLY",
    status: "new"
  )

  create_replies(root, m2, n - 1)
end

Message.destroy_all

root = CustomerMessage.create!(
  customer: Customer.first,
  subject: "ROOT",
  body: "TEST",
  status: "new"

)

create_replies(root, root, 10)