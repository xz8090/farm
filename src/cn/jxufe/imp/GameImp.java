package cn.jxufe.imp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;

import cn.jxufe.dao.LandsDAO;
import cn.jxufe.dao.Seed_land_TypeViewDAO;
import cn.jxufe.entity.Lands;
import cn.jxufe.entity.Seed_land_TypeView;
import cn.jxufe.service.GameService;
import cn.jxufe.websocket.FarmActionHandler;
@Service
public class GameImp implements GameService {	
	
	@Autowired
	FarmActionHandler farmActionHandler;
	@Autowired
	private LandsDAO landsDAO;
	@Autowired
	private Seed_land_TypeViewDAO seed_land_TypeViewDAO;
	
	Timer timer = new Timer();
	
	@Override
	public void farmStart() {
		try {
			checkCropStatus();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*timer.schedule(
				new TimerTask() {
						@Override
						 public void run() {
							try {
								checkCropStatus();
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
								System.out.println("定时器出问题啦！");
							}
							}
						}, 0,2000);*/
	}
	/**
	 * 检查作物状态，并且更新该阶段下作物长虫概率
	* @Title: checkCropStatus  
	* @param @throws Exception    参数  
	* @return void    返回类型  
	* @throws
	 */
	private void checkCropStatus() throws Exception{
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dt= new Date();
		String dateString = formatter.format(dt);
		Long timeSec= dt.getTime();
		List<Lands> landsList = landsDAO.findAll();
		for (int i=0;i<landsList.size();i++) {
			Lands lands=landsList.get(i);
			int cId=lands.getcId();
			int growStep=lands.getGrowStep();
			String startTime=lands.getStartTime();
			int haspest=lands.getHaspest();
			int insect=0;
			while(cId!=0 && growStep<5){
				Long startTimeSec=formatter.parse(startTime).getTime();
				Seed_land_TypeView SLTView = seed_land_TypeViewDAO.findByCIdAndGrowStep(cId, growStep).get(0);
				int growTime=SLTView.getGrowTime();
				if(timeSec>=(startTimeSec+growTime*1000)){
					growStep++;
					startTime=formatter.format(new Date(startTimeSec+growTime*1000));
					insect=SLTView.getInsect();
				}else break;
			}
	
			if(cId!=0 && haspest==0 && growStep!=0 && growStep!=6) haspest=(((Math.random()*100)>insect)?0:1);
			if(growStep==5) {
				lands.setStatus(1);
			}
			lands.setGrowStep(growStep);
			lands.setStartTime(startTime);
			lands.setHaspest(haspest);
			landsDAO.save(lands);
		}
		farmActionHandler.sendMessageToUsers(new TextMessage(dateString));
	}	
	
}