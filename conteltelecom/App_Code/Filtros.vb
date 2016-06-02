Public Class Filtros


    Function FiltraPalavras(ByVal Str As String, ByVal strSql As String, ByVal expressao As String) As String
        Dim strSqlOriginal As String = strSql
        Dim contador As Integer = 0
        Dim palavras As String() = Str.Split(New Char() {" "c})

        ' Percorremos as palavras da strings separadas exibindo-as no ListBox
        Dim palavra As String

        For Each palavra In palavras

            If strSqlOriginal <> "" Then
                If contador = 0 Then
                    strSql = Replace(strSqlOriginal, "(1 = 1)", expressao & " LIKE '%" & (palavra) & "%'")

                Else
                    strSql = strSql & " union " & Replace(strSqlOriginal, "(1 = 1)", expressao & " LIKE '%" & (palavra) & "%'")
                End If

            End If

            ' 'STSQL = "Select        IE_ITENS.COD_ITEM, IE_ITENS.DES_ITEM, IE_MASCARAS.COD_NIV1 As MARCA FROM IE_ITENS, IE_MASCARAS WHERE IE_ITENS.COD_ITEM = IE_MASCARAS.COD_ITEM And IE_ITENS.COD_ITEM = IE_MASCARAS.COD_ITEM And IE_ITENS.COD_ITEM = IE_MASCARAS.COD_ITEM And (IE_ITENS.IND_INATIVO = 0) And (IE_MASCARAS.COD_MASCARA = 110) And (DES_ITEM Like '%" & Str() & "%') AND (IND_INATIVO = 0)" &
            '       " UNION  SELECT        IE_ITENS.COD_ITEM, IE_ITENS.DES_ITEM  , IE_MASCARAS.COD_NIV1 AS MARCA  FROM IE_ITENS, IE_MASCARAS " &
            '  "WHERE        IE_ITENS.COD_ITEM = IE_MASCARAS.COD_ITEM AND (IE_MASCARAS.COD_MASCARA = 110) AND (IE_MASCARAS.COD_NIV1 LIKE '%" & UCase(palavra) & "%')" &
            '              "            UNION  SELECT        IE_ITENS.COD_ITEM, IE_ITENS.DES_ITEM   , IE_MASCARAS.COD_NIV1 AS MARCA   FROM IE_ITENS, IE_MASCARAS " &
            '  "WHERE        IE_ITENS.COD_ITEM = IE_MASCARAS.COD_ITEM AND (IE_MASCARAS.COD_MASCARA = 111) AND (IE_MASCARAS.COD_NIV1 LIKE '%" & UCase(palavra) & "%')"
            contador += 1
        Next





        Return strSql
    End Function

End Class
