Configuration SampleWeb
{
	Import-DscResource -Module xWebAdministration

	Node $AllNodes.NodeName
	{
		File CopyDeploymentBits
		{
			Ensure = "Present"
			Type = "Directory"
			Recurse = $true
			SourcePath = $applicationPath
			DestinationPath = $Node.DeploymentPath
		}

		WindowsFeature AspNet45
		{
			Ensure = "Present"
			Name = "Web-Asp-Net45"
		}

		WindowsFeature IIS
		{
			Ensure = "Present"
			Name = "Web-Server"
			DependsOn = "[WindowsFeature]AspNet45"
		}	

		xWebAppPool NewWebAppPool 
        { 
            Name   = $WebAppPoolName 
            Ensure = "Present" 
            State  = "Started" 
        } 	

		xWebsite SampleWebSite
		{
			Ensure = "Present"
			Name = $Node.WebsiteName
			State = "Started"
			PhysicalPath = $Node.DeploymentPath
			ApplicationPool = $WebAppPoolName
			BindingInfo = MSFT_xWebBindingInformation 
                { 
                 Port = $WebsitePort
                } 
			DependsOn = "[WindowsFeature]IIS"
		}
	}
}

SampleWeb -ConfigurationData $ConfigData -Verbose
