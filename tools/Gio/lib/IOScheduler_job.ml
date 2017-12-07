open Ctypes
open Foreign

type t
let t_typ : t structure typ = structure "IOScheduler_job"

(*Not implemented g_io_scheduler_job_send_to_mainloop argument typecallback not handled*)
(*Not implemented g_io_scheduler_job_send_to_mainloop_async argument typecallback not handled*)
