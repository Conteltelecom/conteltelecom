Public Class TipoDispositivo
    Public Shared Function isMobileBrowser() As Boolean
        'GETS THE CURRENT USER CONTEXT
        Dim context As HttpContext = HttpContext.Current
        'FIRST TRY BUILT IN ASP.NT CHECK
        If context.Request.Browser.IsMobileDevice Then
            Return True
        End If
        'THEN TRY CHECKING FOR THE HTTP_X_WAP_PROFILE HEADER
        If context.Request.ServerVariables("HTTP_X_WAP_PROFILE") IsNot Nothing Then
            Return True
        End If
        'THEN TRY CHECKING THAT HTTP_ACCEPT EXISTS AND CONTAINS WAP
        If context.Request.ServerVariables("HTTP_ACCEPT") IsNot Nothing AndAlso context.Request.ServerVariables("HTTP_ACCEPT").ToLower().Contains("wap") Then
            Return True
        End If
        'AND FINALLY CHECK THE HTTP_USER_AGENT 
        'HEADER VARIABLE FOR ANY ONE OF THE FOLLOWING
        If context.Request.ServerVariables("HTTP_USER_AGENT") IsNot Nothing Then
            'Create a list of all mobile types
            Dim mobiles As String() = {"midp", "j2me", "avant", "docomo", "novarra", "palmos",
                "palmsource", "240x320", "opwv", "chtml", "pda", "windows ce",
                "mmp/", "blackberry", "mib/", "symbian", "wireless", "nokia",
                "hand", "mobi", "phone", "cdm", "up.b", "audio",
                "SIE-", "SEC-", "samsung", "HTC", "mot-", "mitsu",
                "sagem", "sony", "alcatel", "lg", "eric", "vx",
                "NEC", "philips", "mmm", "xx", "panasonic", "sharp",
                "wap", "sch", "rover", "pocket", "benq", "java",
                "pt", "pg", "vox", "amoi", "bird", "compal",
                "kg", "voda", "sany", "kdd", "dbt", "sendo",
                "sgh", "gradi", "jb", "dddi", "moto", "iphone"}

            'Loop through each item in the list created above 
            'and check if the header contains that text
            For Each s As String In mobiles
                If context.Request.ServerVariables("HTTP_USER_AGENT").ToLower().Contains(s.ToLower()) Then
                    Return True
                End If
            Next
        End If

        Return False
    End Function

End Class
