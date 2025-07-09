module 0x42::example {
  public fun aborts() {
    abort 42
  }
}
 
script {
  fun always_aborts() {
    0x42::example::aborts()
  }
}