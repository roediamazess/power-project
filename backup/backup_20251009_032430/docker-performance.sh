#!/bin/bash

# Docker Performance Monitoring Script
# Usage: ./docker-performance.sh

echo "🐳 Docker Performance Monitor"
echo "============================="

# Container Status
echo "📊 Container Status:"
docker-compose ps

echo -e "\n📈 Resource Usage:"
docker stats --no-stream --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}\t{{.BlockIO}}"

echo -e "\n⚡ Application Performance Test:"
echo "Testing http://localhost response time..."
curl -o /dev/null -s -w "Response Time: %{time_total}s\n" http://localhost

echo -e "\n🔍 OPcache Status:"
docker-compose exec -T app php -r "
\$status = opcache_get_status();
echo 'OPcache Enabled: ' . (\$status['opcache_enabled'] ? '✅' : '❌') . PHP_EOL;
echo 'Memory Used: ' . round(\$status['memory_usage']['used_memory'] / 1024 / 1024, 2) . ' MB' . PHP_EOL;
echo 'Memory Free: ' . round(\$status['memory_usage']['free_memory'] / 1024 / 1024, 2) . ' MB' . PHP_EOL;
echo 'Cached Files: ' . \$status['opcache_statistics']['num_cached_scripts'] . PHP_EOL;
"

echo -e "\n💾 Laravel Cache Status:"
docker-compose exec -T app php artisan cache:table-size 2>/dev/null || echo "Cache table not available"

echo -e "\n🔄 Redis Status:"
docker-compose exec -T redis redis-cli -a redispassword info | grep -E "(connected_clients|used_memory_human|total_commands_processed)" || echo "Redis not accessible"

echo -e "\n📝 Recommendations:"
echo "- Use 'delegated' mount for better performance"
echo "- Enable OPcache for PHP acceleration"
echo "- Use Redis for session/cache storage"
echo "- Implement CDN for static assets"
echo "- Monitor with Laravel Telescope"