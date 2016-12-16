$ConfigData = @{
    AllNodes = @(
		@{ NodeName = "*"},

        @{	NodeName = "localhost";
            WebsiteName = "SampleWeb"
			DeploymentPath = $env:SystemDrive + "\inetpub\SampleWeb"
        }
    )
}