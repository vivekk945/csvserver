1.Run the container image infracloudio/csvserver:latest in background and check if it's running.

--sudo docker run -it -d infracloudio/csvserver:latest

2.If it's failing then try to find the reason, once you find the reason, move to the next step.

--docker logs -f 24239cff186ee5e1eae494ec69b38a823a98764df6ef4a3b6a4124e8baf9758a
2021/07/03 08:46:32 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory

3.Write a bash script gencsv.sh to generate a file named inputFile whose content looks like:
0, 234
1, 98
2, 34
-- gencsv.sh has the script

4.Run the container again in the background with file generated in (3) available inside the container (remember the reason you found in (2)).

--sudo docker run -it -v /home/ubuntu/inputFile:/csvserver/inputdata -d infracloudio/csvserver:latest

5.Get shell access to the container and find the port on which the application is listening. Once done, stop / delete the running container.

--sudo docker exec -it bcd0cf65ebf8 bash
--netstat -anp

6.Same as (4), run the container and make sure,
The application is accessible on the host at http://localhost:9393
Set the environment variable CSVSERVER_BORDER to have value Orange

--sudo docker run -it --name demo -v /home/ubuntu/inputFile:/csvserver/inputdata -p 9393:9300 -e CSVSERVER_BORDER="Orange" -d infracloudio/csvserver