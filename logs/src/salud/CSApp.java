/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package salud;

import java.util.Date;

/**
 *
 * @author luciano
 */
public class CSApp
{
	String m_modulo;
	int depth_ste = 3;

	public CSApp()
	{
		m_modulo = getClass().getName();
	}
	private String getMethodName()
	{
		final StackTraceElement[] ste = Thread.currentThread().getStackTrace();
		return ste[depth_ste].getMethodName();
	}
	private void SaveLog(String method)
	{
		Date d = new Date();
		System.out.println(m_modulo+"#"+method+"#"+d);
	}
	public void SaveLogThread()
	{
		final String method = getMethodName();
		new Thread(new Runnable() 
		{
			@Override
			public void run()
			{
				SaveLog(method);
			}
		}).start();
	}
}