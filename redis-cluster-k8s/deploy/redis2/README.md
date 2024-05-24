** initiate cluster

```json
kubectl exec -it redis-cluster-0 -n redis-ns -- redis-cli --cluster create --cluster-replicas 1 $(kubectl get pods -l app=redis-cluster -n redis-ns -o jsonpath='{range.items[*]}{.status.podIP}:6379 ' | tr ' ' '\n' | grep -v '^:6379$' | paste -sd ' ')
```
