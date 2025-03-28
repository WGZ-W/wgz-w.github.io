
# Troubleshooting SSH


## ssh: connect to host github.com port 22: connection timed out


如果你电脑上的git能在大部分地方进行同步，但是在某处地方的网络下无法同步，并且运行 git pull 或 git push 长久没有反映，最后出现 ssh: connect to host github.com port 22: Connection timed out ，很可能是你的网络供应商（比如广电网）在出口防火墙上屏蔽了 22 端口，这意味着你将无法访问其他主机的 22 端口。

对此， github 提供了一种解决方案，允许你使用 443 端口进行 ssh 连接，因为 443 端口是访问 https 网站所必须的，大部分防火墙都会允许通过，但如果使用代理服务器可能产生干扰。如果连 443 端口都被屏蔽，那你应该无法浏览这篇文章。

先换个端口试试，看看是否有成功提示，如果有成功提示，则可以使用这个解决方案。
```
ssh -T -p 443 git@ssh.github.com
# Hi USERNAME! You've successfully authenticated, but GitHub does not provide shell access.
```

简单地配置一下，让你每次 ssh 连接 Github 都通过 443 端口。Linux（在 `~/.ssh/config` 中）、Windows（在 `C:\Users\[Name]\.ssh\config` 中）添加以下内容：
```
# Add section below to it
Host github.com
	Hostname ssh.github.com
	Port 443
```

## See Also
- [Using SSH over the HTTPS port](https://docs.github.com/en/authentication/troubleshooting-ssh/using-ssh-over-the-https-port)