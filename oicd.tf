data "tls_certificate" "oicd-tls-data" {
  url = data.aws_eks_cluster.eks.identity.0.oidc.0.issuer
}

resource "aws_iam_openid_connect_provider" "oicd-provider" {
  url = module.eks.cluster_oidc_issuer_url

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = [data.tls_certificate.oicd-tls-data.certificates.0.sha1_fingerprint]
}

resource "aws_eks_identity_provider_config" "oicd-eks-assoc" {
  cluster_name = module.eks.cluster_id

  oidc {
    client_id                     = "sts.amazonaws.com"
    identity_provider_config_name = var.oicd_idp_config_name
    issuer_url                    = module.eks.cluster_oidc_issuer_url
  }
}