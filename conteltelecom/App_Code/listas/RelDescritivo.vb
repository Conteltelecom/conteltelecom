Friend Class RelDescritivo
    Public Property NomeAgrupamento As String
    Public Property RazaoSocial As String
    Public Property Cnpj As String
    Public Property Cidades As String
    Public Property CodLinha As String
    Public Property NumLInha As String
    Public Property DescricaoServico As String
    Public Property Ordem As String
    Public Property Valor As Decimal

    Public Sub New(ByVal nomeAgrupamento As String, ByVal razaoSocial As String,
                   ByVal cnpj As String, ByVal cidades As String, ByVal codLinha As String,
                   ByVal numLInha As String, ByVal descricaoServico As String, ByVal ordem As Integer, ByVal valor As Decimal)
        Me.NomeAgrupamento = nomeAgrupamento
        Me.RazaoSocial = razaoSocial
        Me.Cnpj = cnpj
        Me.Cidades = cidades
        Me.CodLinha = codLinha
        Me.NumLInha = numLInha
        Me.DescricaoServico = descricaoServico
        Me.Ordem = ordem
        Me.Valor = valor
    End Sub
End Class
