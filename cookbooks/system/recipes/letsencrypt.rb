# Manage Let's Encrypt things.

# 0 0,12 * * * python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew 
cron "Renew Let's Encrypt Certificates" do
  minute '0'
  hour '0,12'
  command "python -c 'import random; import time; time.sleep(random.random() * 3600)' && certbot renew"
end
