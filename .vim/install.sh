cd 'bundle';

for url in `grep github ../pluginlist`; do
	`git clone ${url}`;
done

for url in `grep bitbucket ../pluginlist`; do
	`hg clone ${url}`;
done
