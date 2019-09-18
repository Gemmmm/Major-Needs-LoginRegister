package Init;

import java.util.Random;

import dao.PlatformDaoImpl;
import riqi.NowTime;
import model.Platform;

public class Initdata {
	public static void main(String[] args)
	{
		Platform platform =new Platform();
		PlatformDaoImpl platformDaoImpl=new PlatformDaoImpl();
		for(int i=2;i<200;i++)
		{
			platform.setPlatformid(i+"");
			platform.setPlatformname(i+"");
			String technology=null;
			int j=i%3;
			if(j==0)
				technology="重点实验室";
			if(j==1)
				technology="工程技术研究中心";
			if(j==2)
				technology="产业技术研究院";
		    platform.setPlatformtechnology(technology);
		 	platform.setPassword(i+"");
		 	platform.setPlatformdate(NowTime.nowtime());
		 	platform.setPlatformpizhunnum(i+"");
		 	
		 	platformDaoImpl.add(platform);
		}
	}

}
