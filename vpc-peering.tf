resource "aws_vpc_peering_connection" "requester" {
  provider      = aws.requester
  peer_vpc_id   = var.accepter_vpc_id
  peer_owner_id = var.accepter_owner_id
  vpc_id        = var.requester_vpc_id
  peer_region   = var.accepter_region
}

resource "aws_vpc_peering_connection_accepter" "accepter" {
  provider                  = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection.requester.id
  auto_accept               = true
}

resource "aws_vpc_peering_connection_options" "requester" {
  provider                  = aws.requester
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.accepter.id

  requester {
    allow_remote_vpc_dns_resolution  = true
  }
}

resource "aws_vpc_peering_connection_options" "accepter" {
  provider                  = aws.accepter
  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.accepter.id

  accepter {
    allow_remote_vpc_dns_resolution  = true
  }
}
