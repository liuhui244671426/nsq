package util

import (
	"sync"
)

type WaitGroupWrapper struct {
	sync.WaitGroup
}
//维护的引用计数
func (w *WaitGroupWrapper) Wrap(cb func()) {
	w.Add(1)
	go func() {
		cb()
		w.Done()
	}()
}
