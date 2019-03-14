class Account::Tickets::TicketLogs

  attr_accessor :ticket, :ticketupdated, :ticketold

  def self.create(ticket)
    TicketLog.create(
      ticket: ticket,
      log: {
        action: "Ticket Created with:",
        changes: {
          title: "#{ticket.title}",
          description: "#{ticket.description}",
          kind: "#{ticket.kind.description}",
          status: "#{ticket.status.description}",
          assignee: "#{ticket.assignee.name}",
        }
      }
    )
  end
  def self.update(ticketupdated,ticketold)
    TicketLog.create(
      ticket: ticketupdated,
      log: {
        action: "Ticket Updated with:",
        changes: {
          title: "#{ticketold.title} to #{ticketupdated.title}",
          description: "#{ticketold.description} to #{ticketupdated.description}",
          kind: "#{ticketold.kind.description} to #{ticketupdated.kind.description}",
          status: "#{ticketold.status.description} to #{ticketupdated.status.description}",
          assignee: "#{ticketold.assignee.name} to #{ticketupdated.assignee.name}",
        }
      }
    )
  end
  def self.cancel(ticket)
    TicketLog.create(
      ticket: ticket,
      log: {
        action: "Ticket Canceled with:",
        changes: {
          title: "#{ticket.title}",
          description: "#{ticket.description}",
          kind: "#{ticket.kind.description}",
          status: "#{ticket.status.description}",
          assignee: "#{ticket.assignee.name}",
        }
      }
    )
  end
  def self.reopen(ticket)
    TicketLog.create(
      ticket: ticket,
      log: {
        action: "Ticket Updated with:",
        changes: {
          title: "#{ticket.title}",
          description: "#{ticket.description}",
          kind: "#{ticket.kind.description}",
          status: "#{ticket.status.description}",
          assignee: "#{ticket.assignee.name}",
        }
      }
    )
  end

end
